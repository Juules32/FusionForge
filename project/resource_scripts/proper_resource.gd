# This code was copied from github user: https://github.com/595145489
# To fix a bug with the duplicate method: https://github.com/godotengine/godot/issues/74918
# Thank you! 😭

# The parent 'duplicate' method should never be called
# Instead, use the 'proper_duplicate' method

extends Resource
class_name ProperResource

func proper_duplicate(flag := false):
	var newRes = self.duplicate(flag)
	if flag:
		newRes._CheckDuplicateRes()
	return newRes

func _ArrayCheck(pvalue):
	var needcpobj = {}
	for i in range(pvalue.size()):
		var value = pvalue[i]
		var vtype = typeof(value)
		#handle type obj copy
		if vtype == TYPE_OBJECT:
			if not value.has_method("proper_duplicate"): continue
			var dpvalue = value.proper_duplicate(true)
			needcpobj[i] = dpvalue
		else:
			self._CheckType(vtype,value)

	for i in needcpobj.keys():
		pvalue[i] = needcpobj[i]
	return

func _DictionaryCheck(pvalue):
	var needcpobj = {}
	for key in pvalue:
		var value = pvalue[key]
		var vtype = typeof(value)
		#handle type obj copy
		if vtype == TYPE_OBJECT:
			if not value.has_method("proper_duplicate"): continue
			var dpvalue = value.proper_duplicate(true)
			needcpobj[key] = dpvalue
		else:
			self._CheckType(vtype,value)

	for i in needcpobj.keys():
		pvalue[i] = needcpobj[i]
	return

func _CheckType(type, value):
	match type:
		TYPE_ARRAY:
			_ArrayCheck(value)
			return
		TYPE_DICTIONARY:
			_DictionaryCheck(value)
			return
		TYPE_OBJECT:
			if value.has_method("_CheckDuplicateRes"):
				value._CheckDuplicateRes()
			return

func _CheckDuplicateRes():
	for property in self.get_property_list():
		if property.usage & PROPERTY_USAGE_SCRIPT_VARIABLE:
			var value = self.get(property.name)
			if value == null: continue
			var type = property.type
			self._CheckType(type,value)
	return
