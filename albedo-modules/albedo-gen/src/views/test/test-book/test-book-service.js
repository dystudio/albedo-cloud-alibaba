import request from '@/router/axios';
import validate from "@/util/validate";
const testBookService = {
	page(query) {
	  return request({
		url: '/test/test-book/',
		method: 'get',
		params: query
	  })
	},

	save(obj) {
	  return request({
		url: '/test/test-book/',
		method: 'post',
		data: obj
	  })
	},

	find(id) {
	  return request({
		url: '/test/test-book/' + id,
		method: 'get'
	  })
	},

	remove(id) {
	  return request({
		url: '/test/test-book/' + id,
		method: 'delete'
	  })
	},

	validateUnique(rule, value, callback, id) {
	  validate.isUnique(rule, value, callback, '/test/test-book/checkByProperty?id='+validate.toStr(id))
	}
}
export default testBookService