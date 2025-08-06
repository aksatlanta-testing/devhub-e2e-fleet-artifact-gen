
{{- define "go-echof125d5a8-30d8-451a-9fdb-0fcd2782174c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof125d5a8-30d8-451a-9fdb-0fcd2782174c.fullname" -}}
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


{{- define "go-echof125d5a8-30d8-451a-9fdb-0fcd2782174c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof125d5a8-30d8-451a-9fdb-0fcd2782174c.labels" -}}
helm.sh/chart: {{ include "go-echof125d5a8-30d8-451a-9fdb-0fcd2782174c.chart" . }}
{{ include "go-echof125d5a8-30d8-451a-9fdb-0fcd2782174c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof125d5a8-30d8-451a-9fdb-0fcd2782174c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof125d5a8-30d8-451a-9fdb-0fcd2782174c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}