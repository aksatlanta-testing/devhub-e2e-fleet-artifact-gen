
{{- define "go-echobd10128f-518b-4505-9b4d-c28cc8bb3641.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd10128f-518b-4505-9b4d-c28cc8bb3641.fullname" -}}
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


{{- define "go-echobd10128f-518b-4505-9b4d-c28cc8bb3641.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd10128f-518b-4505-9b4d-c28cc8bb3641.labels" -}}
helm.sh/chart: {{ include "go-echobd10128f-518b-4505-9b4d-c28cc8bb3641.chart" . }}
{{ include "go-echobd10128f-518b-4505-9b4d-c28cc8bb3641.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobd10128f-518b-4505-9b4d-c28cc8bb3641.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobd10128f-518b-4505-9b4d-c28cc8bb3641.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}