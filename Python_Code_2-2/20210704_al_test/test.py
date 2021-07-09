import math


def solution(progresses, speeds):
    answer = []

    day_left = []
    for i in range(len(progresses)):
        day_left.append(math.ceil((100 - progresses[i]) / speeds[i]))

    while len(day_left) > 1:
        i = 0
        x = day_left[i + 1]
        if day_left[0] < day_left[1]:
            answer.append(1)
            day_left.pop(0)
        else:
            while day_left[0] < x:
                i += 1
                x = day_left[i + 1]
                if day_left[0] > x:
                    for j in range(i):
                        day_left.pop(0)
                        return
                    answer.append(i)

    if len(day_left) == 1:
        answer.append(1)

    return print(answer)

solution([93,30,55],[1,30,5])