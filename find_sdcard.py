import subprocess

def find_sdcard ():
    result = []
    output = subprocess.check_output("lsblk").decode('utf-8')
    for line in output.split("\n"):
        if "disk" in line and "G" in line:
            fields = line.strip().split()
            dev_name = "/dev/" + fields[0]
            dev_size = float(fields[3][:-1])
            #print(f"dev_name={dev_name}, dev_size={dev_size}")

            if dev_size < 100: #容量小於100G就當記憶卡
                result.append(dev_name)

    return result
def main():
    result = find_sdcard()

    if len(result ) > 1:
        print("found more then two SD cards...")
        exit(1)

    if len(result) == 0:
        print("not found any SD card...")
        exit(2)

    if len(result ) == 1:
        print(result[0])
        exit(0)

if __name__ == '__main__':
    main()
    