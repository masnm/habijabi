#!/bin/bash

FILES="my_accepted_wrong_ans_cmnd.sh
	my_input_submit_cmnd.sh
	my_code_compile_cmnd.sh
	my_time_memory_usage_cmnd.sh
	my_code_runner_cmnd.sh
	my_verdict_cmnd.sh
	my_gdb_debug_cmnd.sh"

read -p "Want to setup Scripts? [Y/N] " response
if [[ $response == [Yy] ]]; then
	for FILE in $FILES
	do
		ln -s $(pwd)/$FILE /bin/$FILE
	done
fi
