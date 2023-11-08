#!/usr/bin/env bash

while :; do
  echo "What would you like to do"
  echo "0-ONLY ADDING UNCOMPLETED TASKS TO COMPLETED"
  echo "1-ADDING UNCOMPLETED TASKS"
  echo "2-DELETING UNCOMPLETED TASKS"
  echo "3-SHOWING UNCOMPLETED TASKS"
  echo "4-SHOWING DELETED TASKS"
  echo "5-SHOWING COMPLETED TASKS"
  echo "6-SEARCHING FOR SPECIAL TASK"
  echo "7-EXIT"

  read choice
  case $choice in
  0)
    echo "Adding uncompleted tasks to CompletedTasks.txt..."
    read TEXT0
    if grep -q "$TEXT0" UncompletedTasks.txt; then
      echo "$TEXT0" >> CompletedTasks.txt
      sed -i "/$TEXT0/d" UncompletedTasks.txt
      echo "Task added to CompletedTasks.txt and removed from UncompletedTasks.txt"
    else
      echo "Task not found in UncompletedTasks.txt"
    fi
    ;;
  1)
    echo "Adding tasks..."
    read TEXT1
    echo "$TEXT1" >> UncompletedTasks.txt
    echo "Task added to UncompletedTasks.txt"
    ;;
  2)
    echo "Deleting task..."
    read TEXT2
    if grep -q "$TEXT2" UncompletedTasks.txt; then
      echo "$TEXT2" >> DeletedTasks.txt
      sed -i "/$TEXT2/d" UncompletedTasks.txt
      echo "Task deleted and moved to DeletedTasks.txt"
    else
      echo "Task not found in UncompletedTasks.txt"
    fi
    ;;
  3)
    echo "Showing uncompleted tasks : "
    cat UncompletedTasks.txt
    ;;
  4)
    echo "Showing deleted tasks : "
    cat DeletedTasks.txt
    ;;
  5)
    echo "Showing completed tasks : "
    cat CompletedTasks.txt
    ;;
  6)
    echo "Search for a special task:"
    read TEXT3

    if grep -i "$TEXT3" UncompletedTasks.txt; then
      echo "Task found in UncompletedTasks.txt"
    fi

    if grep -q -i "$TEXT3" DeletedTasks.txt; then
      echo "Task found in DeletedTasks.txt"
    fi

    if grep -q -i "$TEXT3" CompletedTasks.txt; then
      echo "Task found in CompletedTasks.txt"
    fi

    if ! grep -q -i "$TEXT3" UncompletedTasks.txt && ! grep -q -i "$TEXT3" DeletedTasks.txt && ! grep -q -i "$TEXT3" CompletedTasks.txt; then
      echo "Task not found in any of the files"
    fi
    ;;
  7)
    echo "Exiting the script..."
    exit 0
    ;;
  esac
done
