#!/bin/sh
for todofile in '0_items.todofile' '3_items.todofile'; do
    echo $todofile
    ./todo_total tests/test_todo_files/${todofile}
    echo ""
done
