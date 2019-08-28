json.merge! @quests.map{ |q| {title: q.title, desc: q.description, where: q.address, mode: q.mode,
                              ppl: q.people_wanted, xp: q.category.xp, when: q.begin_on, time: q.duration}}
