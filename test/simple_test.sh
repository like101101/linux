if [[ ! -a kernel ]]; then
    echo "FAIL: kernel not made"
    echo "0/1"
    exit -1
fi

echo PASS
echo 1/1

