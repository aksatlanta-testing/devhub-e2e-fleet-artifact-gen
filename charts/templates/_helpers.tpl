
{{- define "go-echoc8bbb177-1c7a-4419-b9fe-c78015f3cd1c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc8bbb177-1c7a-4419-b9fe-c78015f3cd1c.fullname" -}}
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


{{- define "go-echoc8bbb177-1c7a-4419-b9fe-c78015f3cd1c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc8bbb177-1c7a-4419-b9fe-c78015f3cd1c.labels" -}}
helm.sh/chart: {{ include "go-echoc8bbb177-1c7a-4419-b9fe-c78015f3cd1c.chart" . }}
{{ include "go-echoc8bbb177-1c7a-4419-b9fe-c78015f3cd1c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc8bbb177-1c7a-4419-b9fe-c78015f3cd1c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc8bbb177-1c7a-4419-b9fe-c78015f3cd1c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}