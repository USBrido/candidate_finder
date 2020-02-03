# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program


# Finding candidates
def find(id)
  @candidates.each do |candidate|
  if id == candidate[:id] 
    return candidate
  end
end

  nil
end


# experienced
def experienced?(candidate)
  if candidate[:years_of_experience] >= 2 
    true
  else
  false 
end
end

def qualified_candidates(candidates)
  quali =[]
  candidates.each do |candidate|  #for loop statement
    if qualified?(candidate)
      quali.push candidate  # the symbol << works the same as push
    end
  end
  quali
end

def qualified?(candidates)
  experienced?(candidates) &&
  languages(candidates) &&
  git_points(candidates) &&
  applied_recently(candidates) &&
  of_age(candidates)
end

def languages(candidate)
  candidate[:languages].include?( "Ruby") || candidate[:languages].include?("Python") 
    ##include? to sort through the object values
end

def git_points(candidate)
  if candidate[:github_points] >= 100
    true
  end
end

def applied_recently(candidates)
  if candidates[:date_applied] > 15.days.ago.to_date
    true
  end
end

def of_age(candidates)
  if candidates[:age] >= 18
    true
  end
end




# sort on experience and points
def ordered_by_qualifications(candidates)
  candidates.sort_by{ |candidate| [candidate[:years_of_experience], candidate[:github_points]] }
  .reverse

end

# More methods will go below
