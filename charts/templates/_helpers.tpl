
{{- define "go-echo711837c7-ba02-4ea9-9385-84246c26819a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo711837c7-ba02-4ea9-9385-84246c26819a.fullname" -}}
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


{{- define "go-echo711837c7-ba02-4ea9-9385-84246c26819a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo711837c7-ba02-4ea9-9385-84246c26819a.labels" -}}
helm.sh/chart: {{ include "go-echo711837c7-ba02-4ea9-9385-84246c26819a.chart" . }}
{{ include "go-echo711837c7-ba02-4ea9-9385-84246c26819a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo711837c7-ba02-4ea9-9385-84246c26819a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo711837c7-ba02-4ea9-9385-84246c26819a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}