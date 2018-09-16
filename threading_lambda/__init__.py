from threading import Thread

def run_test_lambda(event, context):
    print('hello world')

def threading_task(numb):
    print(numb)

def threading_test_lambda(event, context):
    threads = []
    for numb in range(10):
        t = Thread(target=threading_task, args=(numb,))
        threads.append(t)

    for thread in threads:
        thread.start()

    for thread in threads:
        thread.join()

    print("finished")


if __name__=="__main__":
    threading_test_lambda(None,None)
