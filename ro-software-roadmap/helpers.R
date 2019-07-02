cum_commits_split <- function(x = NULL, exclude) {
  dat <- dplyr::tbl_df(get_github(x))
  dat_no_staff <- dplyr::filter(dat, !author %in% exclude)

  ## summarise
  dat <- dat %>%
    group_by(date) %>%
    summarise(count = n()) %>%
    mutate(cumsum = cumsum(count))
  dat_no_staff <- dat_no_staff %>%
    group_by(date) %>%
    summarise(count = n()) %>%
    mutate(cumsum = cumsum(count))

  ## plot
  ggplot(dat, aes(date, cumsum)) +
    geom_line(size = 2) +
    geom_line(aes(date, cumsum), data = dat_no_staff, color = "blue", size = 2) +
    theme_grey(base_size = 18) +
    scale_x_date(labels = scales::date_format("%Y/%m")) +
    labs(x = 'May 2011 to Nov 2017', y = 'Cumulative Code Contributions')
}

cum_commits_split2 <- function(x = NULL, staff) {
  dat <- dplyr::tbl_df(get_github(x))
  dat_only_staff <- dplyr::filter(dat, author %in% staff)
  dat_no_staff <- dplyr::filter(dat, !author %in% staff)

  ## summarise
  dat_only_staff <- dat_only_staff %>%
    group_by(date) %>%
    summarise(count = n()) %>%
    mutate(cumsum = cumsum(count))
  dat_no_staff <- dat_no_staff %>%
    group_by(date) %>%
    summarise(count = n()) %>%
    mutate(cumsum = cumsum(count))

  ## plot
  ggplot(dat_only_staff, aes(date, cumsum)) +
    geom_line(size = 2) +
    geom_line(aes(date, cumsum), data = dat_no_staff, color = "blue", size = 2) +
    theme_grey(base_size = 18) +
    scale_x_date(labels = scales::date_format("%Y/%m")) +
    labs(x = 'May 2011 to Nov 2017', y = 'Cumulative Code Contributions')
}

