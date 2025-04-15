
{{- define "go-echoba225439-d2ff-4934-98d9-cd3aece8050d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba225439-d2ff-4934-98d9-cd3aece8050d.fullname" -}}
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


{{- define "go-echoba225439-d2ff-4934-98d9-cd3aece8050d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba225439-d2ff-4934-98d9-cd3aece8050d.labels" -}}
helm.sh/chart: {{ include "go-echoba225439-d2ff-4934-98d9-cd3aece8050d.chart" . }}
{{ include "go-echoba225439-d2ff-4934-98d9-cd3aece8050d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoba225439-d2ff-4934-98d9-cd3aece8050d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoba225439-d2ff-4934-98d9-cd3aece8050d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}