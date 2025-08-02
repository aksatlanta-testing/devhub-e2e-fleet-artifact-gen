
{{- define "go-echoecdb42f7-177b-470a-88f7-6eb626224273.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoecdb42f7-177b-470a-88f7-6eb626224273.fullname" -}}
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


{{- define "go-echoecdb42f7-177b-470a-88f7-6eb626224273.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoecdb42f7-177b-470a-88f7-6eb626224273.labels" -}}
helm.sh/chart: {{ include "go-echoecdb42f7-177b-470a-88f7-6eb626224273.chart" . }}
{{ include "go-echoecdb42f7-177b-470a-88f7-6eb626224273.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoecdb42f7-177b-470a-88f7-6eb626224273.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoecdb42f7-177b-470a-88f7-6eb626224273.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}