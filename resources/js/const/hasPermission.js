
/**
 * @param array permissions - Permissions array
 * @param string permission - specific permission to search
 */


function hasPermission(permissions, permission) {
    const _ = require('lodash');

    return !_.find(permissions, {name: permission})
}


module.exports = {
    hasPermission: hasPermission,
};
