
{{- define "go-echoec0c2cdb-eb17-4ed0-9550-eeb30121d521.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec0c2cdb-eb17-4ed0-9550-eeb30121d521.fullname" -}}
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


{{- define "go-echoec0c2cdb-eb17-4ed0-9550-eeb30121d521.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec0c2cdb-eb17-4ed0-9550-eeb30121d521.labels" -}}
helm.sh/chart: {{ include "go-echoec0c2cdb-eb17-4ed0-9550-eeb30121d521.chart" . }}
{{ include "go-echoec0c2cdb-eb17-4ed0-9550-eeb30121d521.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoec0c2cdb-eb17-4ed0-9550-eeb30121d521.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoec0c2cdb-eb17-4ed0-9550-eeb30121d521.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}