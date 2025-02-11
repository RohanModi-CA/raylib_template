# Define the marker file or directory to look for (you can use multiple)
marker=".git"  # Example: Look for a .git directory

# Function to find the project root
find_project_root() {
  current_dir=$(pwd)

  while true; do
    if [ -e "$current_dir/$marker" ]; then  # Check if marker exists in current directory
      echo "Project root found: $current_dir"
      cd "$current_dir"
      return 0  # Success
    fi

    if [ "$current_dir" = "/" ]; then  # Reached root directory without finding marker
      echo "Error: Project root marker '$marker' not found!"
      return 1  # Failure
    fi

    cd ..  # Go up one directory level
    current_dir=$(pwd)
  done
}

find_project_root


echo ""
echo ""
echo "======================================================="
if make
then
echo "======================================================="
echo ""
echo ""
./mygame
else
echo "======================================================="
fi

