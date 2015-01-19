# merge spreadsheet file from Databrary with aggregate

out.dir <- "../aggregate-data"
in.dir <- "~/Downloads"
out.fn <- "databrary-session-data.csv"
vol <- 73

# Download spreadsheet from Databrary
#download.file(url="https://nyu.databrary.org:8024/volume/73/csv", destfile=paste("databrary",vol,".csv",sep=""), method="curl", quiet = FALSE )
# 201-01-15 fails because of security/SSL issues

# detect databrary and volume name at front and csv at the tail
fn.patt <- paste("^databrary", vol, ".*csv$", sep="")
sess.fn <- list.files(path=in.dir, pattern=fn.patt)

# Copy file to project directory, force overwrite
file.copy( from=paste(in.dir, sess.fn, sep="/"), to=paste(out.dir, out.fn, sep="/"), overwrite=TRUE )

# Read data frames
df.moco <- read.csv("../aggregate-data/adult-laminar-radial-grouped.csv")
df.session <- read.csv( paste( out.dir, out.fn, sep="/") )

# Merge data frames
df.merge <- merge( df.moco, df.session, by.x=c("ParticipantID","SessionDate"), by.y=c("participant.ident", "session.date"))

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