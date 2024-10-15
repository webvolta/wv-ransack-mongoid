module Ransack
  class Visitor
    def visit_and(object)
      nodes = object.values.map { |o| accept(o) }.compact
      nodes.inject(&:and)
    end

    def visit_or(object)
      nodes = object.values.map { |o| accept(o) }.compact
      nodes.inject(&:or)
    end

    def quoted?(object)
      raise "not implemented"
    end

    def visit_Ransack_Nodes_Sort(object)
      object.attr.send(object.dir) if object.valid?
    end
  end
end
