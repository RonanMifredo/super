import subprocess

output = subprocess.check_output(["boinccmd", "--get_tasks"])
lines = output.splitlines()

textTaskName = "   name: "
textTaskProjectUrl = "project URL: "
# textTaskReportDeadline = "report deadline: "
textTaskEstimatedTime = "estimated CPU time remaining"


taskName = ""
projectUrl = ""
taskEstimatedTimeString = ""

countTasks = 0
moyEstimatedTime = 0
allEstimatedTimes = ""

for i in range(0, len(lines)):
	try:
		pos = lines[i].index(textTaskName)
		taskName = lines[i][len(textTaskName)+pos:]
	except ValueError:
		pass
	try:
		pos = lines[i].index(textTaskProjectUrl)
		projectUrl = lines[i][len(textTaskProjectUrl)+pos:]
	except ValueError:
		pass
	try:
		pos = lines[i].index(textTaskEstimatedTime)
		taskEstimatedTimeString = lines[i][len(textTaskEstimatedTime)+pos:]
		# print taskName
		# print projectUrl
		# print taskEstimatedTimeString
		# print "------"
		time = float(taskEstimatedTimeString)
		moyEstimatedTime += time
		allEstimatedTimes += time+" "
		# 3000=50min
		if time > 3000:
			print "stopping task"+taskName+" for project "+projectUrl
			subprocess.check_output(["boinccmd", "--task", projectUrl, taskName, "abort"])

		++countTasks

	except ValueError:
		pass

print "Number of tasks: "+str(countTasks)
print "Moy estimated time: "+str(moyEstimatedTime/countTasks)+" ("+allEstimatedTimes+")"

