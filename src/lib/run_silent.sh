run_silent() {
  echo $@
  command ${@} &> /dev/null
}
