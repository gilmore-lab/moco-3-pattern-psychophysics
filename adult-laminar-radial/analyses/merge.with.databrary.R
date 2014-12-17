# merge spreadsheet file from Databrary with aggregate

out.dir <- "../aggregate-data"
in.dir <- "~/Downloads"
fn.sess <- "databrary-session-data.csv"
vol <- 73

# detect volume name at front and csv at the tail
fn.patt <- paste("^", vol, ".*csv$", sep="")
sess.fn <- list.files(path=in.dir, pattern=fn.patt)

# Download file from https://nyu.databrary.org/volume/73
file.copy( from=paste(in.dir, sess.fn, sep="/"), to=paste(out.dir, out.fn, sep="/") )

# Read data frames
df.moco <- read.csv("../aggregate-data/adult-laminar-radial-grouped.csv")
df.session <- read.csv( paste( out.dir, out.fn, sep="/") )

# Merge data frames
df.merge <- merge( df.moco, df.session, by.x=c("ParticipantID","SessionDate"), by.y=c("participant.ID", "session.date"))

# Calculate age at test
df.merge$participant.birthdate <- as.Date( df.merge$participant.birthdate )
df.merge$SessionDate <- as.Date( df.merge$SessionDate )
age.days <- df.merge$SessionDate - df.merge$participant.birthdate
df.merge$AgeDays <- as.numeric( age.days / 365.25 )

# clean-up/remove unneeded variables
drops = c("participant.birthdate", "task.ID", "task.description", "task.2.ID", "task.2.description")
df.merge <- df.merge[,!( names(df.merge) %in% drops ) ]
rm( df.moco, df.session, age.days, drops )

# export merged data
write.csv(df.merge, file = "../aggregate-data/adult-laminar-radial-grouped-merged.csv" )