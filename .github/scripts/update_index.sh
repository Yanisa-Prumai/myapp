#!/bin/bash

TASK_OUTPUT_FILE=$1
TEST_OUTPUT_FILE=$2
HTML_FILE="/app/index.html"

TODO_TASKS=$(awk '/ToDo Tasks:/{flag=1;next}/Done Tasks:/{flag=0}flag' "$TASK_OUTPUT_FILE")
DONE_TASKS=$(awk '/Done Tasks:/{flag=1;next}flag' "$TASK_OUTPUT_FILE")
TEST_RESULTS=$(cat "$TEST_OUTPUT_FILE")

update_pre() {
  local pre_id=$1
  local new_content=$2
  local html_file=$3

  perl -0pi -e "s|(<pre id=\"$pre_id\">).*?(</pre>)|\$1$new_content\$2|s" "$html_file"
}

update_pre "todo-tasks" "$TODO_TASKS" "$HTML_FILE"
update_pre "done-tasks" "$DONE_TASKS" "$HTML_FILE"
update_pre "test-results" "$TEST_RESULTS" "$HTML_FILE"

git config --global user.name "github-actions"
git config --global user.email "github-actions@users.noreply.github.com"

git add "$HTML_FILE"
git commit -m "Update index.html with task output and test results"
git push