
{{- define "go-echoabba79e4-540a-4fa9-b992-52ff0c1e73bd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoabba79e4-540a-4fa9-b992-52ff0c1e73bd.fullname" -}}
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


{{- define "go-echoabba79e4-540a-4fa9-b992-52ff0c1e73bd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoabba79e4-540a-4fa9-b992-52ff0c1e73bd.labels" -}}
helm.sh/chart: {{ include "go-echoabba79e4-540a-4fa9-b992-52ff0c1e73bd.chart" . }}
{{ include "go-echoabba79e4-540a-4fa9-b992-52ff0c1e73bd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoabba79e4-540a-4fa9-b992-52ff0c1e73bd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoabba79e4-540a-4fa9-b992-52ff0c1e73bd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}