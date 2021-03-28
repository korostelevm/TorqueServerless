
const lambda_handler = async function(event,context){
    console.log('EVENT:',event)
    console.log('CONTEXT:',context)
    console.log('ENV:',process.env)
    return {
        statusCode: 200,
        body: 'OK!',
        // headers: {'content-type':'text/html'}
      };
}

module.exports = {
    lambda_handler
}