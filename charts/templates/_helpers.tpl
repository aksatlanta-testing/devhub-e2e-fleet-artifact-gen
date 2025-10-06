
{{- define "go-echobc45d73d-51ee-4fb6-b8a8-ff725ec25544.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc45d73d-51ee-4fb6-b8a8-ff725ec25544.fullname" -}}
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


{{- define "go-echobc45d73d-51ee-4fb6-b8a8-ff725ec25544.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc45d73d-51ee-4fb6-b8a8-ff725ec25544.labels" -}}
helm.sh/chart: {{ include "go-echobc45d73d-51ee-4fb6-b8a8-ff725ec25544.chart" . }}
{{ include "go-echobc45d73d-51ee-4fb6-b8a8-ff725ec25544.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobc45d73d-51ee-4fb6-b8a8-ff725ec25544.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobc45d73d-51ee-4fb6-b8a8-ff725ec25544.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}