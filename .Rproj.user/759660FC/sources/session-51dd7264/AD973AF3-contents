create_your_unique_dataset <- function(loan_data, student_number){

  set.seed(student_number)

  # Get all loan ids
  all_loan_ids = loan_data |>
    pull(loan_id) |>
    unique()

  total_num_loans = length(all_loan_ids)

  # Sample to get your loan ids
  your_loan_ids = sample(all_loan_ids,
                         0.25*total_num_loans, 
                         replace = FALSE)

  # Simulate names by gender
  num_no_specified_gender = round(0.05*total_num_loans)
  num_f_gender = round(((runif(1)*10 + 45)/100)*total_num_loans)
  num_m_gender = total_num_loans - num_no_specified_gender - num_f_gender

  genderless_names = randomNames(num_no_specified_gender)
  f_names = randomNames(num_f_gender, gender = 1)
  m_names = randomNames(num_m_gender, gender = 0)

  simulated_names = c(genderless_names, f_names, m_names)
  matching_genders = c(rep(NA, num_no_specified_gender),
                       rep("F", num_f_gender),
                       rep("M", num_m_gender))

  # Simulate ages
  simulated_ages = sample(18:75, total_num_loans, replace = TRUE)

  # Shuffle loan ids
  shuffled_loan_ids = sample(all_loan_ids, total_num_loans,
                             replace = FALSE)

  # Your unique people 
  your_loan_people = data.frame(
    names = simulated_names,
    gender = matching_genders,
    age = simulated_ages,
    loan_id = shuffled_loan_ids)

  # Your unique loan data
  your_loan_data = loan_data |>
    filter(loan_id %in% your_loan_ids) |>
    left_join(your_loan_people)

  return(your_loan_data)

}
