
{{- define "go-echof330f50c-b4ba-4079-82d7-40cd0ff02bfe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof330f50c-b4ba-4079-82d7-40cd0ff02bfe.fullname" -}}
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


{{- define "go-echof330f50c-b4ba-4079-82d7-40cd0ff02bfe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof330f50c-b4ba-4079-82d7-40cd0ff02bfe.labels" -}}
helm.sh/chart: {{ include "go-echof330f50c-b4ba-4079-82d7-40cd0ff02bfe.chart" . }}
{{ include "go-echof330f50c-b4ba-4079-82d7-40cd0ff02bfe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof330f50c-b4ba-4079-82d7-40cd0ff02bfe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof330f50c-b4ba-4079-82d7-40cd0ff02bfe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}