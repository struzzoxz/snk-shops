$(function(){
    function display(bool) {
        if (bool){
            $("#container").show()
        } else {
            $("#container").hide()
        }
    }

    display(false)
    let container = document.getElementById('container')

    window.addEventListener("message", function(event){
        
        let item = event.data
        let items = item.items
        if (item.type === "ui"){
            if (item.status){
                display(true)
                for(const[k,v] of Object.entries(items)){
                    if(container.querySelector(`#${v.id}`) === null){
                        let div = $(`<div class="tieniilcibo" ></div>`)
                        div.attr('id', v.id)
                        let img = $(`<img src="${v.img}"></img>`).appendTo(div)
                        let h1 = $(`<h1>${v.name}</h1>`).appendTo(div)
                        $(`<input type='number'  min='1' placeholder='Quantità' class='input' id='${v.id}-input'>`).appendTo(div)
                        let button = $(`<button class="button" onclick=craft(${JSON.stringify(v.id)})>COMPRA</button>`).appendTo(div)
                        $('#container').append(div)
                    } else{
                    }
                }
             }
             else {
                display(false)
             }             
    }
})





    $(".close").click(function ()
    {$.post(`https://${GetParentResourceName()}/esci`, JSON.stringify({})) })
    })
    


