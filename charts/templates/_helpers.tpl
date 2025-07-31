
{{- define "go-echoaa97d695-b9ae-4493-a8fd-b942f657ebff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaa97d695-b9ae-4493-a8fd-b942f657ebff.fullname" -}}
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


{{- define "go-echoaa97d695-b9ae-4493-a8fd-b942f657ebff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaa97d695-b9ae-4493-a8fd-b942f657ebff.labels" -}}
helm.sh/chart: {{ include "go-echoaa97d695-b9ae-4493-a8fd-b942f657ebff.chart" . }}
{{ include "go-echoaa97d695-b9ae-4493-a8fd-b942f657ebff.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaa97d695-b9ae-4493-a8fd-b942f657ebff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaa97d695-b9ae-4493-a8fd-b942f657ebff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}