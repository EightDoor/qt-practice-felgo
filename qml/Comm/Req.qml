import QtQuick 2.0
import Felgo 3.0
import "../../Config/index.js" as Config

// 通用的数据请求方法
Item {
    id: root

    function sendData(method, url, data) {
        var p = Promise.create(function(resolve, reject) {
            if(method.toUpperCase() === 'GET') {
                HttpRequest.get(Config.baseUrl + url, data).end(function (error, res) {

                    if(res.ok)
                        resolve(res.body)
                    else
                        reject(error.message)
                })
            } else if(method.toUpperCase() === 'POST') {
                HttpRequest.post(Config.baseUrl + url, data).end(function (error, res) {

                    if(res.ok)
                        resolve(res.body)
                    else
                        reject(error.message)
                })
            }
        })
        return p;
    }
}
