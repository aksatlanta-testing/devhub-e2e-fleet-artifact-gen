
{{- define "go-echoec646ece-628e-453d-a17f-12952fb31797.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec646ece-628e-453d-a17f-12952fb31797.fullname" -}}
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


{{- define "go-echoec646ece-628e-453d-a17f-12952fb31797.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec646ece-628e-453d-a17f-12952fb31797.labels" -}}
helm.sh/chart: {{ include "go-echoec646ece-628e-453d-a17f-12952fb31797.chart" . }}
{{ include "go-echoec646ece-628e-453d-a17f-12952fb31797.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoec646ece-628e-453d-a17f-12952fb31797.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoec646ece-628e-453d-a17f-12952fb31797.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}