#!/bin/sh

for todofile in 'important_todo.todofile' 'normal_todo.todofile' 'no_todo.todofile'; do
    echo $todofile
    ./todo_next tests/test_todo_files/$todofile
    echo ""
done
