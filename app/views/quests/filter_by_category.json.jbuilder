json.merge! @quests.map{ |q| {title: q.title, desc: q.description, where: q.address, mode: q.mode, id: q.id,
                              ppl: q.people_wanted, xp: q.category.xp, when: q.begin_on.strftime("%d/%m/%Y"), time: q.duration}}
