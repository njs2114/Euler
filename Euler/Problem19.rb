#1 Jan 1900 was a Monday
# => 1900 was not a leap year
# => There were 365 days in 1900
# => Day of the week moves forward 1 on normal and 2 on leap years
# => 1 Jan 1901 was a Tuesday

# day 1 = 1 Jan 1901
# first Sunday is 6 Jan 1901

# September, April, June, and November have 30 days
# January, March, May, July, August, October, and December have 31 days
# February has 28 days except on leap years

# How many Sundays fell on the first of the month
# =>  during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

require "date"

# Leap years occur on years divisible by 4, but not on centuries
# => unless it is divisible by 400
def isLeapYear?(year)
  if (year % 4 != 0)
    return false
  elsif (year % 100 != 0)
    return true
  elsif (year % 400 != 0)
    return false
  else
    return true
  end
end

def daysInYear(year)
  if isLeapYear?(year)
    return 366
  else
    return 365
  end
end

def daysInMonth(month, year)
  case month
  when "jan", "Jan", "1", 1
    return 31
  when "feb", "Feb", "2", 2
    if isLeapYear?(year)
      return 29
    else
      return 28
    end
  when "mar", "Mar", "3", 3
    return 31
  when "apr", "Apr", "4", 4
    return 30
  when "may", "May", "5", 5
    return 31
  when "jun", "Jun", "6", 6
    return 30
  when "jul", "Jul", "7", 7
    return 31
  when "aug", "Aug", "8", 8
    return 31
  when "sep", "Sep", "9", 9
    return 30
  when "oct", "Oct", "10", 10
    return 31
  when "nov", "Nov", "11", 11
    return 30
  when "dec", "Dec", "12", 12
    return 31
  end
end

def daysSince1901(day, year)
  days = 0
  (1901...year).each { |yr| days += daysInYear(yr) }
  days += day
  return days # account for days starting at 1 instead of 0
end

def isFirstOfMonth?(day, year)
  leapFirstOfMonth = [1, 32, 61, 92, 122, 153, 182, 214, 245, 275, 306, 336]
  nonLeapFirstOfMonth = [1, 32, 60, 91, 121, 152, 181, 213, 244, 274, 305, 335]
  if isLeapYear?(year)
    return true if leapFirstOfMonth.include?(day)
  else
    return true if nonLeapFirstOfMonth.include?(day)
  end
  return false
end

def isSunday?(day, year)
  return (daysSince1901(day,year) - 6) % 7 == 0
end

def dumbApproach
  firstSunday = 6
  currentYear = 1901
  totalDays = firstSunday
  dayOfYear = firstSunday
  sunCount = 0
  tempDays = firstSunday

  6.step((daysSince1901(366, 2000)), 7) do |sun|
    if daysInYear(currentYear) > tempDays
      dayOfYear = tempDays
    else
      tempDays -= daysInYear(currentYear)
      dayOfYear = tempDays
      currentYear += 1
    end
    tempDays += 7
    if isSunday?(dayOfYear, currentYear)
      if isFirstOfMonth?(dayOfYear, currentYear)
        print currentYear , " ", dayOfYear
        puts
        sunCount += 1
      end
    end
  end
end

#smart approach
sundays = 0;

(1901..2000).each do |year|
  (1..12).each do |month|
    if DateTime.new(year,month,1).sunday?
      sundays += 1
    end
  end
end

p sundays
