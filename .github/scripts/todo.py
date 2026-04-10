class Task:
    def __init__(self, title, status="ToDo"):
        self.title = title
        self.completed = False
        self.status = status

        if self.status == "Done":
            self.completed = True

    def mark_completed(self):
        self.completed = True
        self.status = "Done"

    def __repr__(self):
        return f"{self.title} - {self.status}"

    def __str__(self):
        return f"Task: {self.title}, Status: {self.status}"


class TaskPool:
    def __init__(self):
        self.tasks = []

    def populate(self):
        task1 = Task("Create project board")
        task2 = Task("Create issue")
        task3 = Task("Create pull request")
        task4 = Task("Update workflow")
        task5 = Task("Test pipeline")
        task6 = Task("Merge branch")

        task1.mark_completed()
        task2.mark_completed()
        task3.mark_completed()

        self.tasks = [task1, task2, task3, task4, task5, task6]

    def add_task(self, task):
        self.tasks.append(task)

    def get_open_tasks(self):
        return [task for task in self.tasks if task.status == "ToDo"]

    def get_done_tasks(self):
        return [task for task in self.tasks if task.status == "Done"]


def main():
    pool = TaskPool()
    pool.populate()

    open_titles = [task.title for task in pool.get_open_tasks()]
    done_titles = [task.title for task in pool.get_done_tasks()]

    print("ToDo Tasks:")
    for title in open_titles:
        print(title)

    print("\nDone Tasks:")
    for title in done_titles:
        print(title)


if __name__ == "__main__":
    main()