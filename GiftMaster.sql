select
  LiveItemId,
  Name,
  ResourceFilePath,
  RequiredPoint,
  CanCombo,
  date(StartTime, "Asia/Tokyo") as StartDate,
  date(EndTime) as EndDate, --Asia/Tokyoに直すと、10000-01-01が出るのでやめておきました
  case
    when CURRENT_DATE() between date(StartTime, "Asia/Tokyo") and date(EndTime) then 1
    else 0
  end as EnabledFlag
from
  `prd_iriam_external.GiftMaster`