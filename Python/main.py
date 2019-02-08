from Tkinter import*

root =Tk()

frame1=Frame(root, width = 500, height = 400)
frame1.pack()

Label(frame1,text="Validador de Cedula", fg="Red", font=("Arial",18)).place(x=135,y=30)

def is_valid_date(action, char, text):
    # Solo chequear cuando se añade un carácter.
    if action != "1":
        return True
    return char in "0123456789" and len(text) < 11


labela=StringVar()
Label(frame1,text="Cedula", fg="Black", font=("Arial",18)).place(x=60,y=80)
Label(frame1,text="Cedula Correcta", fg="Black", font=("Arial",18),textvariable=labela).place(x=60,y=300)
validatecommand = root.register(is_valid_date)
cedulavar=StringVar()
Cedula = Entry(frame1,textvariable=cedulavar, text="Validador de Cedula", fg="Black", font=("Arial",18)).place(x=150,y=80)

def onclic1():
    c = 0
    result = 0
    p = 0
    uj = 0    
    a = list(cedulavar.get())
    b = [1,2,1,2,1,2,1,2,1,2]
    if len(a) < 11 :
        labela.set("Cedula Incorrecta")
    else :
        for i in range(10):        
            c = int(a[i]) * b[i]
            if c >= 10 :
                d = list(str(c))
                c = int(d[0]) + int(d[1])
            result = result + c     
        
        p = int(list(str(result))[0] + "0")    
        uj = ( p / 10) * 10
        if uj < result :
            result = (uj + 10) - result
        
        if result == int(a[10]) :
            labela.set("Cedula Correcta")
        else :
            labela.set("Cedula Incorrecta")


            

    print(result)    
        
    


boton1 = Button(frame1, text="Validar", command=onclic1).place(x=135,y=200)


root.mainloop()

