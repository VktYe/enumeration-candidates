# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
    # Your code Here
    candidates.find {|candidate| candidate[:id] == id }
    # candidates.each do |candidate|
    #   return candidate if candidate[:id] == id
    # end
    # nil
  end
  
  def experienced?(candidate)
    # Your code Here
     return candidate[:years_of_experience] >= 2

  end
  
  def qualified_candidates(candidates)
    # Your code Here
    return candidates.find_all do |candidate|
      
      # Returns a subset of the candidates that meet the following criteria:
      # Are experienced
      experienced?(candidate) &&
    # Have 100 or more Github points
      enough_github_points?(candidate) &&

    # Know at least Ruby or Python
      languages_known?(candidate) &&

    # Applied in the last 15 days
    candidate[:date_applied] >= 15.days.ago.to_date &&

    # Are over the age of 17 (18+)
    candidate[:age] >= 18
    end
  end
  
  # More methods will go below

  def enough_github_points?(candidate)
    return candidate[:github_points] >= 200
  end

  def languages_known?(candidate)
    return candidate[:languages].include?("Ruby") || candidate[:languages].include?("Python")
  end

  def ordered_by_qualifications(candidates)
    # return ordered candidates by exp
    candidates.sort_by do |candidate|
      [ 
        -candidate[:years_of_experience],
        -candidate[:github_points]
      ]
      # if exp == order by github points
    end
  end
