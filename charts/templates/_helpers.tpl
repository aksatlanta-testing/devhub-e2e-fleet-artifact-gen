
{{- define "go-echoba30d3ba-b2a9-4fd9-8bf3-ed4e76c3207c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba30d3ba-b2a9-4fd9-8bf3-ed4e76c3207c.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoba30d3ba-b2a9-4fd9-8bf3-ed4e76c3207c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba30d3ba-b2a9-4fd9-8bf3-ed4e76c3207c.labels" -}}
helm.sh/chart: {{ include "go-echoba30d3ba-b2a9-4fd9-8bf3-ed4e76c3207c.chart" . }}
{{ include "go-echoba30d3ba-b2a9-4fd9-8bf3-ed4e76c3207c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoba30d3ba-b2a9-4fd9-8bf3-ed4e76c3207c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoba30d3ba-b2a9-4fd9-8bf3-ed4e76c3207c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}