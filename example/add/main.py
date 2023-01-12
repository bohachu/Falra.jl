from sys import argv


def add(flo1, flo2):
    return flo1 + flo2


if __name__ == "__main__":
    print(add(float(argv[1]), float(argv[2])))
