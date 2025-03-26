
{{- define "go-echof9704d10-15de-4aeb-909a-e449c4b3aa09.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof9704d10-15de-4aeb-909a-e449c4b3aa09.fullname" -}}
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


{{- define "go-echof9704d10-15de-4aeb-909a-e449c4b3aa09.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof9704d10-15de-4aeb-909a-e449c4b3aa09.labels" -}}
helm.sh/chart: {{ include "go-echof9704d10-15de-4aeb-909a-e449c4b3aa09.chart" . }}
{{ include "go-echof9704d10-15de-4aeb-909a-e449c4b3aa09.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof9704d10-15de-4aeb-909a-e449c4b3aa09.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof9704d10-15de-4aeb-909a-e449c4b3aa09.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}