package edu.gemini.tac.persistence.phase1.blueprint.visitor

import javax.persistence._
import edu.gemini.tac.persistence.phase1.blueprint.BlueprintBase
import edu.gemini.tac.persistence.phase1.Instrument
import edu.gemini.model.p1.mutable.Site

@Entity
@DiscriminatorValue("VisitorGNBlueprint")
class VisitorGNBlueprint(b: edu.gemini.model.p1.mutable.VisitorBlueprint) extends BlueprintBase(b.getId, b.getName, Instrument.VISITORGN) with VisitorBlueprint {
  def this() = this(new edu.gemini.model.p1.mutable.VisitorBlueprint())
  @Transient
  override val site = Site.GEMINI_NORTH

  @Column(name = "custom_name")
  override val customName = b.getCustomName
}
