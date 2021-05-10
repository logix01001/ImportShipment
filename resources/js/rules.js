
export default {
    required: [value => !!value || 'Required.'],

	email:[
		v => !v || /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/.test(v) || 'E-mail must be valid'
	],

	password:[
		v => !!v || 'Field is required',
		v => !v || /[0-9]/.test(v) || 'Must contain number',
		v => !v || /[a-zA-Z]/.test(v) || 'Must contain letter',
		// v => !v || /[@$!%*?&]/.test(v) || 'Must contain symbol',
		v => (v || '').length >= 8 || 'Must contain atlest 8 characters.'
	],

	confirmpassword(temp,actual){
		return [v => (temp === actual) || 'Password must match']
	},

	unique(list,title){
		return [
            v => !!v || 'Field is required',
            v => (_.includes(list,v) == false)  || title +' is already exists.'
		]
    },

    lessThanMinimum(minimum,title){
		return [
            v => !!v || 'Field is required',
            v => ( parseInt(v) ) >  parseInt(minimum) || `${title} is less than ${minimum}`
		]
    },

}
