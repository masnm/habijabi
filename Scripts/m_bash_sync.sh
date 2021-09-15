#!/bin/bash

sudo cp my_done_cmnd.sh /bin/my_done_cmnd.sh
sudo cp my_gdb_debug_cmnd.sh /bin/my_gdb_debug_cmnd.sh
sudo cp my_verdict_cmnd.sh /bin/my_verdict_cmnd.sh
sudo cp my_input_submit_cmnd.sh /bin/my_input_submit_cmnd.sh
sudo cp my_accepted_wrong_ans_cmnd.sh /bin/my_accepted_wrong_ans_cmnd.sh
sudo cp my_code_compile_cmnd.sh /bin/my_code_compile_cmnd.sh
sudo cp my_code_runner_cmnd.sh /bin/my_code_runner_cmnd.sh

echo -e '\e[0;33m#___ Dont forgate to make aliases___#\e[m'
echo 'alias dn="my_done_cmnd.sh"'
echo 'alias d="my_gdb_debug_cmnd.sh"'
echo 'alias t="my_verdict_cmnd.sh"'
echo 'alias is="my_input_submit_cmnd.sh"'
echo 'alias v="my_accepted_wrong_ans_cmnd.sh"'
echo 'alias c="my_code_compile_cmnd.sh"'
echo 'alias r="my_code_runner_cmnd.sh"'
