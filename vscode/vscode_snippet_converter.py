import json, os

snippets_file = os.path.expanduser("~/.config/Code/User/snippets/cpp.json")
lib_path = os.path.expanduser("~/compile/olymp-cpp-lib")

def load_snippets():
	f = open(snippets_file, 'r')
	return json.loads(f.read())
	

s = load_snippets()

for subdir, dirs, files in os.walk(lib_path):
	if subdir.startswith(lib_path + "/.git"): continue
	#if subdir.startswith(lib_path + "/well-known"): continue
	if subdir.startswith(lib_path + "/tests"): continue
	for filename in files:
		if filename.endswith(".cpp"):
			title = filename.rsplit('.',1)[0]
			content = open(subdir+"/"+filename, 'r').read()
			item = s.get(title, {})
			item["prefix"] = "@" + title
			new = content.splitlines()
			if new[-1]!="": new.append("")
			if "body" not in item:
				print("added: " + title)
				item["body"] = new
			elif new != item["body"]:
				print("updated: " + title)
				item["body"] = new
			s[title] = item

res = json.dumps(s, indent=4)

fout = open(snippets_file, 'w')
fout.write(res)
fout.close()

print("done")
