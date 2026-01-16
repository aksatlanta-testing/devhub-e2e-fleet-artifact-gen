
{{- define "go-echodc8c21f7-93dc-4d09-971d-bf41813355ef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodc8c21f7-93dc-4d09-971d-bf41813355ef.fullname" -}}
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


{{- define "go-echodc8c21f7-93dc-4d09-971d-bf41813355ef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodc8c21f7-93dc-4d09-971d-bf41813355ef.labels" -}}
helm.sh/chart: {{ include "go-echodc8c21f7-93dc-4d09-971d-bf41813355ef.chart" . }}
{{ include "go-echodc8c21f7-93dc-4d09-971d-bf41813355ef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodc8c21f7-93dc-4d09-971d-bf41813355ef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodc8c21f7-93dc-4d09-971d-bf41813355ef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}