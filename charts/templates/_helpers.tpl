
{{- define "go-echo664e8171-e97f-4efa-816a-d09cc8e1d01c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo664e8171-e97f-4efa-816a-d09cc8e1d01c.fullname" -}}
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


{{- define "go-echo664e8171-e97f-4efa-816a-d09cc8e1d01c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo664e8171-e97f-4efa-816a-d09cc8e1d01c.labels" -}}
helm.sh/chart: {{ include "go-echo664e8171-e97f-4efa-816a-d09cc8e1d01c.chart" . }}
{{ include "go-echo664e8171-e97f-4efa-816a-d09cc8e1d01c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo664e8171-e97f-4efa-816a-d09cc8e1d01c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo664e8171-e97f-4efa-816a-d09cc8e1d01c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}