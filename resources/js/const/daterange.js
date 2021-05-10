function getCurrentStyle(current, today) {
    const style = {};
    if (current.date() === 1) {
      style.border = '1px solid #1890ff';
      style.borderRadius = '50%';
    }
    return style;
}


module.exports = {
    getCurrentStyle: getCurrentStyle,
};
