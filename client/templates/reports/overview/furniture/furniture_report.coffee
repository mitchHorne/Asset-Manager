###
  * * * * * * * * * * * * * * * * * * *
    Furniture Overview Report Creation
  * * * * * * * * * * * * * * * * * * *
###

Template.furniture_report.onCreated ->
  mainDoc = $('html')
  mainDoc.removeClass()
  mainDoc.addClass 'reports'

Template.furniture_report.helpers
  'furniture': ->
    Meteor.subscribe 'furniture'
    return Furniture.find()

  'furnitureCost': ->
    Meteor.subscribe 'furniture'
    furniture = Furniture.find()

    totalFurnitureCost = 0

    furniture.forEach (furniture) ->
      totalFurnitureCost += parseFloat furniture.costPrice

    return totalFurnitureCost

  'showValue': (number) ->
    number += ''
    x = number.split('.')
    x1 = x[0]
    x2 = if x.length > 1 then '.' + x[1] else '.00'
    rgx = /(\d+)(\d{3})/
    while rgx.test(x1)
      x1 = x1.replace(rgx, '$1' + ' ' + '$2')
    return x1 + x2

  'furnitureCount': ->
    Meteor.subscribe 'furniture'
    furniture=Furniture.find()
    count=0
    furniture.forEach ->
      count++
    return count

Template.furniture_report_print.onRendered ->
  window.print()
  Router.go 'furnitureReport'

Template.furniture_report_print.helpers
  'furniture': ->
    Meteor.subscribe 'furniture'
    return Furniture.find()

  'furnitureCost': ->
    Meteor.subscribe 'furniture'
    furniture = Furniture.find()

    totalFurnitureCost = 0

    furniture.forEach (furniture) ->
      totalFurnitureCost += parseFloat furniture.costPrice

    return totalFurnitureCost

  'showValue': (number) ->
    number += ''
    x = number.split('.')
    x1 = x[0]
    x2 = if x.length > 1 then '.' + x[1] else '.00'
    rgx = /(\d+)(\d{3})/
    while rgx.test(x1)
      x1 = x1.replace(rgx, '$1' + ' ' + '$2')
    return x1 + x2

  'furnitureCount': ->
    Meteor.subscribe 'furniture'
    furniture=Furniture.find()
    count=0
    furniture.forEach ->
      count++
    return count