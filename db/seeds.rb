User.create!([
  {
    first_name: 'Betty',
    last_name: 'Crocker',
    pets_attributes: [
      {
        name: 'Flannery',
        appointments_attributes: [
          { date: '2018-10-08 13:00:00' },
          { date: '2018-11-22 13:00:00' },
          { date: '2018-11-25 12:30:00' }
        ]
      }
    ]
  }, {
    first_name: 'Danny',
    last_name: 'Harvest',
    pets_attributes: [
      {
        name: 'Porkchop',
        appointments_attributes: [
          { date: '2017-11-23 10:45:00' },
          { date: '2018-11-22 16:30:00' }
        ]
      }, {
        name: 'Gravy',
        appointments_attributes: [
          { date: '2017-11-23 10:45:00' },
          { date: '2018-11-22 16:30:00' },
          { date: '2019-04-10 16:30:00' }
        ]
      }
    ]
  }, {
    first_name: 'Melissa',
    last_name: 'Smith',
    pets_attributes: [
      {
        name: 'Magnus',
        appointments_attributes: [
          { date: '2018-05-10 18:00:00' }
        ]
      }
    ]
  }, {
    first_name: 'Gwen',
    last_name: 'Liu',
    pets_attributes: [
      {
        name: 'Huey',
        appointments_attributes: [
          { date: '2018-12-15 10:45:00' }
        ]
      }, {
        name: 'Duey',
        appointments_attributes: [
          { date: '2018-12-15 10:45:00' }
        ]
      }, {
        name: 'Louie',
        appointments_attributes: [
          { date: '2018-12-15 10:45:00' }
        ]
      }
    ]
  }
])
